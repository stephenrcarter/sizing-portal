# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


WorkloadType.delete_all
workload_types = WorkloadType.create([{ workload_type_name: "VDI" }, 
                                      { workload_type_name: "Database" },
                                      { workload_type_name: "Manual" }])
