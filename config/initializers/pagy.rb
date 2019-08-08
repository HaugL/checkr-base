# Overflow extra: Allow for easy handling of overflowing pages
# See https://ddnexus.github.io/pagy/extras/overflow
require 'pagy/extras/overflow'
Pagy::VARS[:overflow] = :empty_page    # default  (other options: :last_page and :exception)
