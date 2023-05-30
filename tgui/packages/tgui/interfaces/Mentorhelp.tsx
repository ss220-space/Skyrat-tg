import { useBackend, useLocalState } from '../backend';
import { TextArea, Stack, Button } from '../components';
import { Window } from '../layouts';

type MentorhelpData = {
  mentorCount: number;
};

export const Mentorhelp = (props, context) => {
  const { act, data } = useBackend<MentorhelpData>(context);
  const [mhelpMessage, setMhelpMessage] = useLocalState(
    context,
    'mhelp_message',
    ''
  );

  return (
    <Window title="Create Mentorhelp" theme="admin" height={300} width={500}>
      <Window.Content
        style={{
          'background-image': 'none',
        }}>
        <Stack vertical fill>
          <Stack.Item grow>
            <TextArea
              autoFocus
              height="100%"
              value={mhelpMessage}
              placeholder="Mentor help"
              onChange={(e, value) => setMhelpMessage(value)}
            />
          </Stack.Item>
          <Stack.Item>
            <Button
              color="good"
              fluid
              content="Submit"
              textAlign="center"
              onClick={() =>
                act('ahelp', {
                  message: mhelpMessage,
                })
              }
            />
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};
