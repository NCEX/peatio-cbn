# frozen_string_literal: true

module Peatio
  module Cbn
    module Hooks
      BLOCKCHAIN_VERSION_REQUIREMENT = "~> 1.0.0"
      WALLET_VERSION_REQUIREMENT = "~> 1.0.0"

      class << self
        def check_compatibility
          unless Gem::Requirement.new(BLOCKCHAIN_VERSION_REQUIREMENT)
                                 .satisfied_by?(Gem::Version.new(Peatio::Blockchain::VERSION))
            [
              "Cbn blockchain version requiremnt was not suttisfied by Peatio::Blockchain.",
              "Cbn blockchain requires #{BLOCKCHAIN_VERSION_REQUIREMENT}.",
              "Peatio::Blockchain version is #{Peatio::Blockchain::VERSION}"
            ].join('\n').tap {|s| Kernel.abort s }
          end

          unless Gem::Requirement.new(WALLET_VERSION_REQUIREMENT)
                                 .satisfied_by?(Gem::Version.new(Peatio::Wallet::VERSION))
            [
              "Cbn wallet version requiremnt was not suttisfied by Peatio::Wallet.",
              "Cbn wallet requires #{WALLET_VERSION_REQUIREMENT}.",
              "Peatio::Wallet version is #{Peatio::Wallet::VERSION}"
            ].join('\n').tap {|s| Kernel.abort s }
          end
        end

        def register
          Peatio::Blockchain.registry[:cbn] = Cbn::Blockchain
          Peatio::Wallet.registry[:cbnd] = Cbn::Wallet
        end
      end

      if defined?(Rails::Railtie)
        require "peatio/cbn/railtie"
      else
        check_compatibility
        register
      end
    end
  end
end
