module Brightbox
  desc 'Show detailed type info'
  arg_name 'type-id...'
  command [:show] do |c|

    c.action do |global_options,options,args|

      if args.empty?
        raise "You must specify the types you want to show"
      end

      types = Type.find_or_call(args) do |id|
        warn "Couldn't find type #{id}"
      end

      table_opts = global_options.merge({
                                          :vertical => true,
                                          :fields => [:id, :handle, :status, :name, :ram, :disk, :cores, :description]
                                        })

      render_table(types, table_opts)

    end
  end
end
