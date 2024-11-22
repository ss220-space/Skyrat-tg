// THIS IS A MASSMETA UI FILE

import { useState } from 'react';

import { useBackend, useLocalState } from '../backend';
import {
  Box,
  Collapsible,
  Input,
  LabeledList,
  NoticeBox,
  Section,
  Stack,
  Table,
  Tabs,
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
};

export const Modpacks = (props) => {
  const { data } = useBackend<Data>();
  const { categories } = data;
  const [selectedCategory, setSelectedCategory] = useState(categories[0]);
  return (
    <Window title="Список модификаций" width={480} height={580}>
      <Window.Content>
        <NoticeBox>
          В данный момент идёт наполнение меню модпаков, в игре модицикаций
          больше чем вы можете тут видеть.
        </NoticeBox>
        <Tabs>
          <Tabs.Tab
            selected={selectedCategory === 'Features'}
            onClick={() => setSelectedCategory('Features')}
          >
            Фичи и Приколы
          </Tabs.Tab>
          <Tabs.Tab
            selected={selectedCategory === 'Event'}
            onClick={() => setSelectedCategory('Event')}
          >
            Ивентовое
          </Tabs.Tab>
          <Tabs.Tab
            selected={selectedCategory === 'Misc'}
            onClick={() => setSelectedCategory('Misc')}
          >
            Разное
          </Tabs.Tab>
        </Tabs>
        {(selectedCategory === 'Features' && <FeaturesTable />) ||
          (selectedCategory === 'Event' && <EventTable />) ||
          (selectedCategory === 'Misc' && <MiscTable />)}
      </Window.Content>
    </Window>
  );
};

const FeaturesTable = () => {
  const { data } = useBackend<Data>();
  const { features } = data;

  const [searchText, setSearchText] = useLocalState('searchText', '');

  const searchBar = (
    <Input
      placeholder="Искать модпак-фичу..."
      fluid
      onInput={(e, value) => setSearchText(value)}
    />
  );

  if (features.length === 0) {
    return (
      <NoticeBox>
        Этот сервер не использует какие-либо прикольные Фичи
      </NoticeBox>
    );
  }

  return (
    <Stack fill vertical>
      <Stack.Item>
        <Section fill>{searchBar}</Section>
      </Stack.Item>
      <Stack.Item grow>
        <Section
          fill
          scrollable
          title={
            searchText.length > 0 ? (
              <span>Результаты поиска "{searchText}":</span>
            ) : (
              <span>Суммарно модификации &mdash; {features.length}</span>
            )
          }
        >
          <Stack fill vertical>
            <Stack.Item>
              {features
                .filter(
                  (feature) =>
                    feature.name &&
                    (searchText.length > 0
                      ? feature.name
                          .toLowerCase()
                          .includes(searchText.toLowerCase()) ||
                        feature.desc
                          .toLowerCase()
                          .includes(searchText.toLowerCase()) ||
                        feature.author
                          .toLowerCase()
                          .includes(searchText.toLowerCase())
                      : true),
                )
                .map((feature) => (
                  <Collapsible
                    color="transparent"
                    key={feature.name}
                    title={<span className="color-white">{feature.name}</span>}
                  >
                    <Table.Row key={feature.name}>
                      <Table.Cell collapsing>
                        <Box m={1} className={feature.icon_class} />
                      </Table.Cell>
                      <Table.Cell verticalAlign="top">
                        <Box
                          key={feature.id}
                          style={{
                            borderBottom: '1px solid #888',
                            paddingBottom: '10px',
                            fontSize: '14px',
                            textAlign: 'center',
                          }}
                        >
                          <LabeledList.Item label="Описание">
                            {feature.desc}
                          </LabeledList.Item>
                          <LabeledList.Item label="Автор">
                            {feature.author}
                          </LabeledList.Item>
                        </Box>
                      </Table.Cell>
                    </Table.Row>
                  </Collapsible>
                ))}
            </Stack.Item>
          </Stack>
        </Section>
      </Stack.Item>
    </Stack>
  );
};

const EventTable = () => {
  const { data } = useBackend<Data>();
  const { event } = data;

  const [searchText, setSearchText] = useLocalState('searchText', '');

  const searchBar = (
    <Input
      placeholder="Искать модпак-перевод..."
      fluid
      onInput={(e, value) => setSearchText(value)}
    />
  );

  if (Event.length === 0) {
    return (
      <NoticeBox>
        Этот сервер не использует какие-либо переводы на Русский
      </NoticeBox>
    );
  }

  return (
    <Stack fill vertical>
      <Stack.Item>
        <Section fill>{searchBar}</Section>
      </Stack.Item>
      <Stack.Item grow>
        <Section
          fill
          scrollable
          title={
            searchText.length > 0 ? (
              <span>Результаты поиска "{searchText}":</span>
            ) : (
              <span>Суммарно модификации &mdash; {Event.length}</span>
            )
          }
        >
          <Stack fill vertical>
            <Stack.Item>
              {event
                .filter(
                  (translate) =>
                    translate.name &&
                    (searchText.length > 0
                      ? translate.name
                          .toLowerCase()
                          .includes(searchText.toLowerCase()) ||
                        translate.desc
                          .toLowerCase()
                          .includes(searchText.toLowerCase()) ||
                        translate.author
                          .toLowerCase()
                          .includes(searchText.toLowerCase())
                      : true),
                )
                .map((translate) => (
                  <Collapsible
                    color="transparent"
                    key={translate.name}
                    title={
                      <span className="color-white">{translate.name}</span>
                    }
                  >
                    <Table.Row key={translate.name}>
                      <Table.Cell collapsing>
                        <Box m={1} className={translate.icon_class} />
                      </Table.Cell>
                      <Table.Cell verticalAlign="top">
                        <Box
                          key={translate.id}
                          style={{
                            borderBottom: '1px solid #888',
                            paddingBottom: '10px',
                            fontSize: '14px',
                            textAlign: 'center',
                          }}
                        >
                          <LabeledList.Item label="Описание">
                            {translate.desc}
                          </LabeledList.Item>
                          <LabeledList.Item label="Автор">
                            {translate.author}
                          </LabeledList.Item>
                        </Box>
                      </Table.Cell>
                    </Table.Row>
                  </Collapsible>
                ))}
            </Stack.Item>
          </Stack>
        </Section>
      </Stack.Item>
    </Stack>
  );
};

const MiscTable = () => {
  const { data } = useBackend<Data>();
  const { misc } = data;

  const [searchText, setSearchText] = useLocalState('searchText', '');

  const searchBar = (
    <Input
      placeholder="Искать модпак-скилл ишуя ТГ к*дера..."
      fluid
      onInput={(e, value) => setSearchText(value)}
    />
  );

  if (misc.length === 0) {
    return (
      <NoticeBox>
        Этот сервер не использует какие-либо модификации баланса или ревертов
      </NoticeBox>
    );
  }

  return (
    <Stack fill vertical>
      <Stack.Item>
        <Section fill>{searchBar}</Section>
      </Stack.Item>
      <Stack.Item grow>
        <Section
          fill
          scrollable
          title={
            searchText.length > 0 ? (
              <span>Результаты поиска "{searchText}":</span>
            ) : (
              <span>Суммарно модификации &mdash; {misc.length}</span>
            )
          }
        >
          <Stack fill vertical>
            <Stack.Item>
              {misc
                .filter(
                  (revert) =>
                    revert.name &&
                    (searchText.length > 0
                      ? revert.name
                          .toLowerCase()
                          .includes(searchText.toLowerCase()) ||
                        revert.desc
                          .toLowerCase()
                          .includes(searchText.toLowerCase()) ||
                        revert.author
                          .toLowerCase()
                          .includes(searchText.toLowerCase())
                      : true),
                )
                .map((revert) => (
                  <Collapsible
                    color="transparent"
                    key={revert.name}
                    title={<span className="color-white">{revert.name}</span>}
                  >
                    <Table.Row key={revert.name}>
                      <Table.Cell collapsing>
                        <Box m={1} className={revert.icon_class} />
                      </Table.Cell>
                      <Table.Cell verticalAlign="top">
                        <Box
                          key={revert.id}
                          style={{
                            borderBottom: '1px solid #888',
                            paddingBottom: '10px',
                            fontSize: '14px',
                            textAlign: 'center',
                          }}
                        >
                          <LabeledList.Item label="Описание">
                            {revert.desc}
                          </LabeledList.Item>
                          <LabeledList.Item label="Автор">
                            {revert.author}
                          </LabeledList.Item>
                        </Box>
                      </Table.Cell>
                    </Table.Row>
                  </Collapsible>
                ))}
            </Stack.Item>
          </Stack>
        </Section>
      </Stack.Item>
    </Stack>
  );
};
