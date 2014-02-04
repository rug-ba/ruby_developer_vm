packages = %w(
  libxslt1-dev
  libxml2-dev
  vim-nox
)

packages.each do |pkg|
  package pkg
end
