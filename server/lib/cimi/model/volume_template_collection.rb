# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.  The
# ASF licenses this file to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance with the
# License.  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
# License for the specific language governing permissions and limitations
# under the License.

class CIMI::Model::VolumeTemplateCollection < CIMI::Model::Base

  act_as_root_entity :volume_template

  array :volume_templates do
    scalar :href
  end

  def self.default(context)
    self.new(
      :id => context.volume_template_url,
      :name => 'default',
      :created => Time.now,
      :description => "#{context.driver.name.capitalize} VolumeTemplateCollection",
      :volume_templates => VolumeTemplate.all_uri(context)
    )
  end

end
