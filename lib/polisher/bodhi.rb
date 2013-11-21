# Polisher Bodhi Operations
#
# Licensed under the MIT license
# Copyright (C) 2013 Red Hat, Inc.

require 'pkgwat'

module Polisher
  class Bodhi
    def self.versions_for(name)
      # fedora pkgwat provides a frontend to bodhi
      updates = Pkgwat.get_updates("rubygem-#{name}", 'all', 'all') # TODO set timeout
      updates.reject! { |u|
        u['stable_version'] == 'None' && u['testing_version'] == "None"
      }
      updates.collect { |u| u['release'] }
    end
  end
end