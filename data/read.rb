require 'yaml/store'

store = YAML::Store.new "store.yml"

store.transaction do
	p store.roots.max
end



