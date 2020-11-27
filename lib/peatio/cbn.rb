# frozen_string_literal: true

require "active_support/core_ext/object/blank"
require "active_support/core_ext/enumerable"
require "peatio"

module Peatio
  module Cbn
    require "bigdecimal"
    require "bigdecimal/util"

    require "peatio/cbn/blockchain"
    require "peatio/cbn/client"
    require "peatio/cbn/wallet"

    require "peatio/cbn/hooks"

    require "peatio/cbn/version"
  end
end
