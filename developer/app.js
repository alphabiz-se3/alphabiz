/**
 * Configure app basic info.
 */

/** App name is used everywhere. */
const APP = 'Alphabiz'

const app = {
  /**
   * App name.
   * Recommend using only a-z and A-Z without spaces
   */
  name: APP,
  /**
   * Author name
   */
  author: `${APP} Team <dev@alpha.biz>`,
  /**
   * Developer name for windows.
   * Note that this key should not contain special characters(like `<>` above)
   */
  developer: `${APP} Team`,
  description: `${APP} Blockchain Cryptocurrency Application`,
  publisher: 'CN=zeeis',
  /**
   * Website for your app. Used in linux debian package.
   */
  homepage: 'https://alpha.biz',
  /**
   * Upgrade code for windows.
   * If two app have a same code, windows will remove old one when installing.
   * You can create your own code by running command `npx uuid v4`.
   */
  upgradeCode: '4d8a65aa-fc5b-421c-94ab-cb722ef737e2',
  /**
   * App binding protocol scheme.
   * By default the app will register `alphabiz://` as its url protocol
   */
  protocol: APP.toLowerCase(),
  /**
   * Short url protocol.
   * By default using `ab://`
   */
  shortProtocol: 'ab',
  /**
   * An url to a version.json file, which allows you to add min-version for your app.
   * See this file for more detail.
   */
  versionsUrl: 'https://raw.githubusercontent.com/tanshuai/alphabiz/main/versions.json',
  /**
   * Twitter account for feedback
   */
  twitterAccount: '@alphabiz',
  /**
   * Configure who can register accounts in your app
   */
  register: {
    /**
     * @type { 'none' | 'blacklist' | 'whitelist' }
     * - `none`: any one can register
     * - `blacklist`: countries in list will be disabled
     * - `whitelist`: only countries in list will be enabled
     */
    mode: 'none',
    /**
     * @type { string[] }
     * Country code list. Must be geoip ISO 3166-1-alpha-2 code
     * @see http://www.geonames.org/countries/
     */
    // list: ['US', 'CN']
    list: []
  }
}

console.log('INIT APP CONFIG')
global._app_config_ = app
/**
 * If `alphabiz-libdb` finds LIBDB_NAME in global, it will use the name as
 * internal category, so different builds will have seperated libraries.
 * If you still want to use our official libdb, set the name below to "Alphabiz".
 */
global.LIBDB_NAME = app.name
module.exports = app
