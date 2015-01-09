#!/usr/bin/env ruby

require 'thumbnail'
require 'fileutils'

module Thumbnail
  module Methods
    class << self
      def resize(options)
        %Q{-resize #{options.width}x}
      end
    end
  end
end

current_dir = Dir.pwd
original_filename = 'lorca-dicorcia.jpg'.split('.')

sizes = {
  :small  => 320,
  :medium => 480,
  :large  => 640,
  :huge   => 940
}

sizes.each_pair do |k, v|

  sized_filename = original_filename[0] + "-#{k}." + original_filename[1]

  Thumbnail.create({
    :method => 'resize',
    :in     => File.join(current_dir, original_filename.join('.')),
    :out    => File.join(current_dir, sized_filename),
    :width  => v,
    :height => nil
  })

end


