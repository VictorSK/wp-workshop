# frozen_string_literal: true

# All LOCAL paths are relative to the parent directory of this WP Workshop project.
# All REMOTE paths are absolute from the remote user's home directory.
# Never use a trailing forward slash (/) in your path or folder settings.

CONFIG = {
  # REMOTE connection settings for ssh connections.
  # Can be named alias or IP address.
  remote: {
    host: '',
    user: '',
    live_path: '', # ~/public_html
    staging_path: '' # ~/staging/public_html
  },

  # Domain name settings.
  domain: {
    dev: '', # http://www.samplesite.ldev
    live: '', # https://www.samplesite.com'
    staging: '' # https://staging.samplesite.com
  },

  # Database settings, and WordPress config.
  database: {
    dev_path: './data',
    dev_dump: 'dev_dump.sql',
    remote_path: '~/backup', # Location of backup folder on remote server
    live_dump: 'live_dump.sql',
    live_name: '',
    live_user: '',
    live_password: '',
    live_host: '127.0.0.1',
    staging_dump: 'staging_dump.sql',
    staging_name: '',
    staging_user: '',
    staging_password: '',
    staging_host: '127.0.0.1'
  },

  # Theme settings.
  theme: {
    dev_path: './wp-content/themes',
    dev_folder: '', # mytheme
    remote_path: '/wp-content/themes',
    remote_folder: '' # mytheme
  },

  # Plugin settings.
  plugins: {
    dev_path: './wp-content/plugins',
    dev_mu_path: './wp-content/mu-plugins',
    remote_path: '/wp-content/plugins',
    remote_mu_path: '/wp-content/mu-plugins'
  },

  # Upload settings.
  uploads: {
    dev_path: './wp-content/uploads',
    remote_path: '/wp-content/uploads'
  },

  # Excluded file types from being uploads to remote server.
  excludes: "--exclude='.git/' --exclude='.gitignore' --exclude='.sass-cache/' --exclude='*.DS_Store'"
}.freeze
