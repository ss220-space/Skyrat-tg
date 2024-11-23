// THIS IS NOVARAT TGUI ADDITION

import { useState } from 'react';

import { useBackend } from '../backend';
import {
  Box,
  Button,
  Input,
  LabeledList,
  NoticeBox,
  Section,
  Stack,
} from '../components';
import { Window } from '../layouts';

type Data = {
  categories: string[];
  features: Modpack[];
  event: Modpack[];
  misc: Modpack[];
};

type Modpack = {
  name: string;
  desc: string;
  author: string;
  icon_class: string;
  id: string;
  updates?: ModpackUpdate[];
};

type ModpackUpdate = {
  version: string;
  description: string;
  date: string;
};

export const Modpacks = (props) => {
  const { data } = useBackend<Data>();
  const { categories, features, event, misc } = data;
  const [selectedCategory, setSelectedCategory] = useState(categories[0]);
  const [selectedModpack, setSelectedModpack] = useState<Modpack | null>(null);
  const [searchText, setSearchText] = useState('');

  const getCategoryModpacks = () => {
    switch (selectedCategory) {
      case 'Features':
        return features;
      case 'Event':
        return event;
      case 'Misc':
        return misc;
      default:
        return [];
    }
  };

  const filteredModpacks = getCategoryModpacks().filter(
    (modpack) =>
      modpack.name &&
      (searchText.length === 0 ||
        modpack.name.toLowerCase().includes(searchText.toLowerCase()) ||
        modpack.desc.toLowerCase().includes(searchText.toLowerCase()) ||
        modpack.author.toLowerCase().includes(searchText.toLowerCase())),
  );

  return (
    <Window title="Список модификаций" width={900} height={600}>
      <Window.Content>
        <Stack fill>
          {/* Left Column - Categories */}
          <Stack.Item basis="20%">
            <Section title="Категории" fill scrollable>
              <Stack vertical>
                {categories.map((category) => (
                  <Stack.Item key={category}>
                    <Button
                      fluid
                      selected={selectedCategory === category}
                      onClick={() => {
                        setSelectedCategory(category);
                        setSelectedModpack(null);
                      }}
                    >
                      {category === 'Features'
                        ? 'Фичи и приколы'
                        : category === 'Event'
                          ? 'Ивентовое'
                          : 'Разное (фиксы и удалённое)'}
                    </Button>
                  </Stack.Item>
                ))}
              </Stack>
            </Section>
          </Stack.Item>

          {/* Middle Column - Modpack List */}
          <Stack.Item basis="40%">
            <Section
              title={`${
                selectedCategory === 'Features'
                  ? 'Фичи и приколы'
                  : selectedCategory === 'Event'
                    ? 'Ивентовое'
                    : 'Разное'
              }`}
              fill
              scrollable
            >
              <Stack vertical>
                <Stack.Item>
                  <Input
                    fluid
                    placeholder="Искать модпак..."
                    onInput={(e, value) => setSearchText(value)}
                    mb={1}
                  />
                </Stack.Item>
                {filteredModpacks.length === 0 ? (
                  <NoticeBox>Модпаки не найдено</NoticeBox>
                ) : (
                  filteredModpacks.map((modpack) => (
                    <Stack.Item key={modpack.id}>
                      <Button
                        fluid
                        selected={selectedModpack?.id === modpack.id}
                        onClick={() => setSelectedModpack(modpack)}
                        style={{
                          backgroundColor:
                            selectedModpack?.id === modpack.id
                              ? '#40628a'
                              : '#2a2a2a',
                        }}
                      >
                        <Stack align="center" fill>
                          <Stack.Item>
                            <Box className={modpack.icon_class} />
                          </Stack.Item>
                          <Stack.Item
                            grow
                            ml={1}
                            color="white"
                            style={{
                              whiteSpace: 'nowrap',
                              overflow: 'hidden',
                              textOverflow: 'ellipsis',
                            }}
                          >
                            {modpack.name}
                          </Stack.Item>
                        </Stack>
                      </Button>
                    </Stack.Item>
                  ))
                )}
              </Stack>
            </Section>
          </Stack.Item>

          {/* Right Column - Modpack Details */}
          <Stack.Item basis="40%">
            <Section
              title={selectedModpack ? 'Детали модпака' : 'Выберете модпак'}
              fill
              scrollable
            >
              {selectedModpack ? (
                <Stack vertical>
                  <Stack.Item>
                    <Box textAlign="center" mb={2} fontSize="16px" color="good">
                      {selectedModpack.name}
                    </Box>
                  </Stack.Item>
                  <Stack.Item>
                    <LabeledList>
                      <LabeledList.Item label="Описание">
                        {selectedModpack.desc}
                      </LabeledList.Item>
                      <LabeledList.Item label="Автор">
                        {selectedModpack.author}
                      </LabeledList.Item>
                    </LabeledList>
                  </Stack.Item>
                  <Stack.Item>
                    <Box mt={2}>
                      <Box bold mb={1}>
                        История обновлений:
                      </Box>
                      {selectedModpack.updates &&
                      selectedModpack.updates.length > 0 ? (
                        selectedModpack.updates.map((update) => (
                          <Box
                            key={`${selectedModpack.id}-${update.version}`}
                            className="candystripe"
                            p={1}
                            mb={1}
                          >
                            <Box bold>Версия {update.version}</Box>
                            <Box>{update.description}</Box>
                            <Box opacity={0.7} fontSize="12px">
                              {update.date}
                            </Box>
                          </Box>
                        ))
                      ) : (
                        <NoticeBox>
                          История обновлений отсутствует для этого модпака
                        </NoticeBox>
                      )}
                    </Box>
                  </Stack.Item>
                </Stack>
              ) : (
                <Box textAlign="center" opacity={0.5}>
                  Выберете модпак из списка для просмотра деталей
                </Box>
              )}
            </Section>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};

export default Modpacks;
