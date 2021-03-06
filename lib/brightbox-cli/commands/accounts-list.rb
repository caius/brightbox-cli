module Brightbox
  desc 'List accounts'
  arg_name '[account-id...]'
  command [:list] do |c|
    c.action do |global_options, options, args|

      if args.empty?
        accounts = Account.find(:all)
      else
        accounts = Account.find_or_call(args) do |id|
          warn "Couldn't find account #{id}"
        end
      end

      render_table(accounts, global_options)
    end
  end
end
