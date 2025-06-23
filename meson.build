project('ela', 'vala', 'c', 'fortran')
subdir('src')
vapi_dir = meson.current_source_dir()
add_project_arguments(['--vapidir', vapi_dir], language: 'vala')

# flib = both_libraries(
flib = static_library(
  'fela',
  sources: src,
  override_options : ['fortran_std=legacy'],
  install : false,
)

clib = both_libraries(
  'cela', 'src/cwrapper.f90', link_with: flib, install: false
)

vdeps = [
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
]

fela = executable('fela', 'src/main.f90', link_with: flib)
cela = executable('cela', 'src/main.c', link_with: clib)
vela = executable('vela', 'src/main.vala', dependencies: vdeps, link_with: clib)

test('fela', fela)
test('cela', cela)
test('vela', vela)
