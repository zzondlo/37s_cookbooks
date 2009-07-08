gems_path `gem env gemdir`.chomp!
ruby_path `which ruby`.chomp!

passenger Mash.new unless attribute?("passenger")
passenger[:version]          = '2.2.4'
passenger[:root_path]        = "#{gems_path}/gems/passenger-#{passenger[:version]}"
passenger[:module_path]      = "#{passenger[:root_path]}/ext/apache2/mod_passenger.so"
passenger[:apache_load_path] = '/etc/apache2/mods-available/passenger.load'
passenger[:apache_conf_path] = '/etc/apache2/mods-available/passenger.conf'

ruby_gc = Mash.new unless attribute?("ruby_gc")
ruby_gc[:heap_min_slots] = 500000
ruby_gc[:heap_slots_increment] = 250000
ruby_gc[:heap_slots_growth_factor] = 1
ruby_gc[:malloc_limit] = 50000000
ruby_gc[:heap_free_min] = 4096