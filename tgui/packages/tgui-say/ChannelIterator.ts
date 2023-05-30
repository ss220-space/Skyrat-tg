export type Channel =
  | 'Say'
  | 'Radio'
  | 'Me'
  // SKYRAT EDIT ADDITION START
  | 'Whis'
  | 'LOOC'
  // SKYRAT EDIT ADDITION END
  | 'OOC'
  | 'Admin'
  | 'Mentor'; // SS220 ADD

/**
 * ### ChannelIterator
 * Cycles a predefined list of channels,
 * skipping over blacklisted ones,
 * and providing methods to manage and query the current channel.
 */
export class ChannelIterator {
  private index: number = 0;
  private readonly channels: Channel[] = [
    'Say',
    'Radio',
    'Me',
    // SKYRAT EDIT ADDITION
    'Whis',
    'LOOC',
    // SKYRAT EDIT ADDITION
    'OOC',
    'Admin',
    'Mentor', // SS220 ADD
  ];
  private readonly adminlist: Channel[] = ['Admin', 'Mentor']; // SS220 blacklist->adminlist EDIT
  private readonly quiet: Channel[] = ['OOC', 'LOOC', 'Admin', 'Mentor']; // SKYRAT EDIT CHANGE (Add LOOC)

  public next(): Channel {
    if (this.adminlist.includes(this.channels[this.index])) { // SS220 opposite to usual changing index. But only for adminlist group channels
      for (let index = 1; index <= this.channels.length; index++) {
        let nextIndex = (this.index + index) % this.channels.length;
        if (this.adminlist.includes(this.channels[nextIndex])) {
          this.index = nextIndex;
          break;
        }
      }
    } else {
      for (let index = 1; index <= this.channels.length; index++) {
        let nextIndex = (this.index + index) % this.channels.length;
        if (!this.adminlist.includes(this.channels[nextIndex])) {
          this.index = nextIndex;
          break;
        }
      }
    }

    return this.channels[this.index];
  }

  public set(channel: Channel): void {
    this.index = this.channels.indexOf(channel) || 0;
  }

  public current(): Channel {
    return this.channels[this.index];
  }

  public isSay(): boolean {
    return this.channels[this.index] === 'Say';
  }

  public isVisible(): boolean {
    return !this.quiet.includes(this.channels[this.index]);
  }

  public reset(): void {
    this.index = 0;
  }
}
