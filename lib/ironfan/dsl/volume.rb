module Ironfan
  class Dsl

    class Volume < Ironfan::Dsl
      field     :name,                  String

      magic     :attachable,            String,   :default => 'ebs'
      magic     :availability_zone,     String
      magic     :create_at_launch,      :boolean, :default => false
      magic     :device,                String
      magic     :formattable,           :boolean, :default => false
      magic     :fstype,                String,   :default => 'xfs'
      magic     :in_raid,               String

      # The number of I/O operations per second (IOPS) that the volume supports.
      # valid range: 500-4000
      # Only Provisioned IOPS (SSD, type io1) drives support
      # this. These volumes should be with EBS-optimized machines.
      magic     :iops,                  Integer

      magic     :keep,                  :boolean, :default => true
      magic     :mount_dump,            String
      magic     :mount_pass,            String
      magic     :mount_options,         String,   :default => 'defaults,nouuid,noatime'
      magic     :mount_point,           String
      magic     :mountable,             :boolean, :default => true
      magic     :size,                  String
      magic     :volume_id,             String
      magic     :resizable,             :boolean, :default => false
      magic     :snapshot_id,           String
      magic     :snapshot_name,         String
      magic     :tags,                  Hash,     :default => {}

      # valid types:
      #   gp2 = General Purpose 2
      #   io1 = Provisioned IOPS
      #   standard = Magnetic volumes
      magic     :type,                  String
    end

    class RaidGroup < Volume
      # volumes that comprise this raid group
      magic     :sub_volumes,           Array,    :default => []
      # RAID level (http://en.wikipedia.org/wiki/RAID#Standard_levels)
      magic     :level,                 String
      # Raid chunk size (https://raid.wiki.kernel.org/articles/r/a/i/RAID_setup_cbb2.html)
      magic     :chunk,                 String
      # read-ahead buffer
      magic     :read_ahead,            String

      # Overrides of Volume field defaults
      magic     :attachable,            :boolean, :default => false
      magic     :formattable,           :boolean, :default => true
      magic     :mount_options,         String,   :default => 'defaults,nobootwait,noatime,nouuid,comment=ironfan'
    end

  end
end
