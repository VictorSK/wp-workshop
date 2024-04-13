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
    wp_path: '~/public_html'
  },

  # Domain name settings.
  domain: {
    dev: '',
    live: ''
  },

  # Database settings.
  database: {
    local_path: './data',
    remote_path: '~/backup',
    dump_file: 'dump.sql'
  },

  # Theme settings.
  theme: {
    local_path: './wp-content/themes',
    local_folder: 'inspyretheme',
    remote_path: '/wp-content/themes',
    remote_folder: 'inspyretheme'
  },

  # Plugin settings.
  plugins: {
    local_path: './wp-content/plugins',
    local_mu_path: './wp-content/mu-plugins',
    remote_path: '/wp-content/plugins',
    remote_mu_path: '/wp-content/mu-plugins'
  },

  # Upload settings.
  uploads: {
    local_path: './wp-content/uploads',
    remote_path: '/wp-content/uploads'
  },

  # Excluded file types from being uploads to remote server.
  excludes: "--exclude='.git/' --exclude='.gitignore' --exclude='.sass-cache/' --exclude='*.DS_Store'"
}.freeze
