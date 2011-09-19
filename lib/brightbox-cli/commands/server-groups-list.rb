module Brightbox
  desc 'List server groups'
  arg_name '[server-group-id...]'
  command [:list] do |c|
    c.action do |global_options,options,args|

      # Type.cache_all!
      # Zone.cache_all!
      if args.empty?
        server_groups = ServerGroup.find(:all)
      else
        server_groups = ServerGroup.find_or_call(args) do |id|
          warn "Couldn't find server group #{id}"
        end
      end
      render_table(server_groups, global_options)
    end
  end
end
