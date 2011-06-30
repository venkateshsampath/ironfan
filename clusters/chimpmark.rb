ClusterChef.cluster 'chimpmark' do
  use :defaults
  setup_role_implications

  recipe                "cluster_chef::dedicated_server_tuning"
  role                  "nfs_client"
  role                  "infochimps_base"
  role                  "big_package"
  role                  "hadoop"
  role                  "hadoop_worker"

  recipe                "hadoop_cluster::std_hdfs_dirs"


  cloud do
    backing             "instance"
    image_name          "infochimps-maverick-client"
    region              "us-east-1"
  end

  facet 'master' do
    instances           1
    cloud.flavor        "m1.xlarge"
  end

  facet 'slave' do
    instances           1
    cloud.flavor        "m1.xlarge"
  end

  chef_attributes({
  })

end
