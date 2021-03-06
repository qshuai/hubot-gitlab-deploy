Inflection = require "inflection"

validSlug = "([-_\.0-9a-z\:]+)"

scriptPrefix = process.env['HUBOT_DEPLOY_PREFIX'] || "deploy"

# The :hammer: regex that handles all /deploy requests
DEPLOY_SYNTAX = ///
  (#{scriptPrefix}(?:\:[^\s^!]+)?)      # / prefix
  (!)?\s+                               # Whether or not it was a forced deployment
  #{validSlug}                          # application name, from apps.json
  (?:\/([^\s]+))?                       # Branch or sha to deploy
  (?:\s+(?:to|in|on)\s+                 # http://i.imgur.com/3KqMoRi.gif
  #{validSlug}                          # Environment to release to
  (?:\/([^\s]+))?)?\s*                  # Host filter to try
///i


# /deploys logs
DEPLOYS_SYNTAX = ///
  show\s+#{scriptPrefix}\s+logs     # / prefix
  \s+                             # hwhitespace
  #{validSlug}                    # application name, from apps.json
  (?:\/([^\s]+))?                 # Branch or sha to deploy
  (?:\s+(?:to|in|on)\s+           # http://i.imgur.com/3KqMoRi.gif
  #{validSlug})?                  # Environment to release to
  (?:\s+([0-9]+))?                # According to log the number
///i

exports.DeployPrefix   = scriptPrefix
exports.DeployPattern  = DEPLOY_SYNTAX
exports.DeploysPattern = DEPLOYS_SYNTAX
