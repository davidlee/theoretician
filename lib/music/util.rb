module Music
  module Util
    # SEMITONES_PER_OCTAVE = 12.freeze

=begin
TODO - explain these
it's actually moving a distance of 3 semitones, so will be interesting to see if the
strategy of moving 2 notes holds up ...
=end

    def self.majorify(minor)
      minor.dup.tap do |x|
        2.times { x << x.shift }
      end.freeze
    end

    def self.minorify(major)
      major.dup.tap do |x|
        2.times { x.unshift x.pop }
      end.freeze
    end

    def self.modulo_semitone(n)
      (n - 1) % 12 + 1
    end

    # [2, 2, 1] -> [1, 3, 5, 6]
    def self.build_numeric_scale_from_intervals(intervals, start_at = 1)
      intervals.inject([start_at]) do |array, interval|
        array << interval + array.last
      end.freeze
    end

  end
end