# https://raw.githubusercontent.com/kubinux/misc/master/ycm_extra_conf-kernel.py

import os
import yacbi

THIS_DIR = os.path.dirname(os.path.abspath(__file__))


INCLUDE_DIRS = [
    'arch/x86/include',
    'arch/x86/include/generated',
    'include',
    'arch/x86/include/uapi',
    'arch/x86/include/generated/uapi',
    'include/uapi',
    'include/generated/uapi',
]


DEFAULT_FLAGS = ['-I{0}'.format(os.path.join(THIS_DIR, rel_dir))
                 for rel_dir in INCLUDE_DIRS]
DEFAULT_FLAGS.extend([
    '-include',
    os.path.join(THIS_DIR, 'include/linux/kconfig.h'),
    '-D__KERNEL__'
])


def FlagsForFile(filename, **kwargs):
    flags = yacbi.query_compile_args(THIS_DIR, filename)
    if flags is None:
        flags = DEFAULT_FLAGS
    return {
        'flags': flags,
        'do_cache': True
    }
