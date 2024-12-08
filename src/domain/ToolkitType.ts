export interface WeatherDataType {
  "province": string,
  "city": string,
  "adcode": string,
  "weather": string,
  "temperature": string,
  "winddirection": string,
  "windpower": string,
  "humidity": string,
  "reporttime": string,
  "temperature_float": string,
  "humidity_float": string,
  "ip": string,
}

export interface WeatherDataTypeResponse {
  "status": string,
  "count": string,
  "info": string,
  "infocode": string,
  "lives": [
    {
      "province": string,
      "city": string,
      "adcode": string,
      "weather": string,
      "temperature": string,
      "winddirection": string,
      "windpower": string,
      "humidity": string,
      "reporttime": string,
      "temperature_float": string,
      "humidity_float": string,
      "ip": string,

    }
  ]
}

export interface SystemConfigType {
  id: number,
  config_key: string,
  config_value: string,
  config_desc: string
}


export interface Commit {
  sha: string,
  node_id: string,
  commit: {
    author: any[],
    committer: any[],
    message: string,
    tree: any[],
    url: string,
    comment_count: number,
    verification: any[],
  },
  url: string,
  html_url: string,
  comments_url: string,
  author: {
    login: string,
    id: number,
    node_id: string,
    avatar_url: string,
    gravatar_id: string,
    url: string,
    html_url: string,
    followers_url: string,
    following_url: string,
    gists_url: string,
    starred_url: string,
    subscriptions_url: string,
    organizations_url: string,
    repos_url: string,
    events_url: string,
    received_events_url: string,
    type: string,
    user_view_type: string,
    site_admin: boolean,
  },
  committer: {
    login: string,
    id: number,
    node_id: string,
    avatar_url: string,
    gravatar_id: string,
    url: string,
    html_url: string,
    followers_url: string,
    following_url: string,
    gists_url: string,
    starred_url: string,
    subscriptions_url: string,
    organizations_url: string,
    repos_url: string,
    events_url: string,
    received_events_url: string,
    type: string,
    user_view_type: string,
    site_admin: boolean,
  },
  parents: any[],
}

export interface CommitRunInfo {
  id: number,
  name: string,
  status: number,
  conclusion: string,
  commit_sha: string,
  commit_message: string,
  commit_author: string,
  run_url: string,
  created_at: string,
  avatar_url: string,
  html_url: string
}

export interface CommitType {
  name: string;
  title: string;
  color: string;
  icon: string;
}