from collections import namedtuple

Term = namedtuple('Term', ('value', 'factor'))

ArgEncode = namedtuple('AsmEncode', ('value', 'bincode', 'tailbincode'))
CmdEncode = namedtuple('CmdEncoding', ('name', 'bincode', 'tailbincode'))
DataEncode = namedtuple('DataEncode', ('value', 'binary', 'bincode'))
