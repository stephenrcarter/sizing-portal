# This file should contain all the record creation needed to seed the database 
# with its default values. The data can then be loaded with the rake db:seed 
# (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



WorkloadType.delete_all
WorkloadType.create([{ id=1, workload_type_name: "VDI" },   
                     { id=2, workload_type_name: "Database" },
                     { id=3, workload_type_name: "Manual" }])

NodeType.delete_all
NodeType.create([{ id=1, name: "1050", nodes_per_block: 4, ssd_count: 1, 
                   ssd_raw_size_gb: 400, hdd_count: 4, hdd_raw_size_gb: 1024, 
                   cpu_socket_count: 2, cpu_cores_per_socket: 6, 
                   cpu_clock_speed_mhz: 2000, list_price: 0 },
                 { id=2, name: "3060", nodes_per_block: 4, ssd_count: 2, 
                   ssd_raw_size_gb: 400, hdd_count: 4, hdd_raw_size_gb: 1024, 
                   cpu_socket_count: 2, cpu_cores_per_socket: 10, 
                   cpu_clock_speed_mhz: 2900, list_price: 0 }])

NodeExtraType.delete_all
NodeExtraType.create([{ id=1, name: "K1" },
                      { id=2, name: "K2" },
                      { id=3, name: "Teradici" }])
