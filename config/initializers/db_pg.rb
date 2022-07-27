# save pg database in global var
# DB_PG = YAML::load(ERB.new(File.read(Rails.root.join("config","database_pg.yml"))).result)[Rails.env]