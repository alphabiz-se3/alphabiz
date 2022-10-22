/**
 * Configure update repo, s3 bucket, etc.
 */
module.exports = {
  /**
   * Your github config, used for feedback, upgrade, etc
   */
  github: {
    username: 'tanshuai',
    repo: 'alphabiz',
    /**
     * Internal build repo
     */
    internalRepo: 'alphabiz-app'
  },
  /**
   * Amazon S3 bucket for your app
   */
  bucketUrl: 'https://s3.amazonaws.com/internal.alpha.biz',
  s3DownloadUrl: 'https://d2v5t3td4po4es.cloudfront.net/releases/'
}
