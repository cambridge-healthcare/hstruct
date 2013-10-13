require_relative 'class_hash_args'
require_relative 'class_hash_args_fetch'
require_relative 'attr_extras'
require_relative 'class_args_send'
require_relative 'hstruct'
require_relative 'hash_missing'
require_relative 'open_struct'
require_relative 'hashie'
require_relative 'virtus'

# All benchmarks were run on:
# * ruby 2.0.0p247 (2013-06-27 revision 41674) [x86_64-darwin12.4.0]
# * Intel i7 2.2Ghz (MBP 8,2)
#
#        ClassHashArgs   238075.1 (±9.4%) i/s -     237690 in   1.006158s
#   ClassHashArgsFetch   223183.1 (±8.7%) i/s -     235035 in   1.060172s
#      AttrExtrasClass   117151.4 (±3.1%) i/s -     124553 in   1.064184s
#        ClassArgsSend   105091.4 (±4.2%) i/s -     107544 in   1.025204s
#         PlainHStruct    83266.2 (±2.2%) i/s -      86724 in   1.042059s
#          HashMissing    71163.5 (±3.7%) i/s -      76536 in   1.077050s
#           OpenStruct    24342.6 (±6.1%) i/s -      24310 in   1.003123s
#         HashieStruct    15659.2 (±3.7%) i/s -      16698 in   1.067853s
#         VirtusStruct     6853.9 (±2.5%) i/s -       7359 in   1.074312s
