module Music
  module Constants
    NUMBER_OF_SEMITONES = 12

    WHOLE_STEP = W = 2
    HALF_STEP  = H = 1

    MAJOR_SCALE_FORMULA = [W, W, H, W, W, W, H].freeze

    ALPHABET = (:A..:G).to_a.freeze

    MAJOR      = :major
    MINOR      = :minor
    DOMINANT   = :dominant
    DIMINISHED = :diminished
    SUSPENDED  = :suspended

  end
end