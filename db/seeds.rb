# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


WorkloadType.delete_all
workload_types = WorkloadType.create([{ id=1, workload_type_name: "VDI" }, 
                                      { id=2, workload_type_name: "Database" },
                                      { id=3, workload_type_name: "Manual" }])
