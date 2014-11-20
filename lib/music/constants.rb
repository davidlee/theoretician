module Music
  module Constants

=begin
What's an octave? Talk about the 1:2 ratio etc
=end

=begin
There are 12 equal* divisions (semitones) in an octave in western music; the 13th
semitone will have the same note name as the note you started on, one octave higher.

What's an octave, you ask? It's an interval (or distance between two notes) which
corresponds to a doubling of the frequency of a note. Notes an octave apart sound
somehow very "similar" other than their pitch, so we describe them using the same
letter of the music alphabet.

[footnote] semitones are only truly equal in tempered tuning

[footnote] why are there 12 semitones? summarise / link to these:
http://math.stackexchange.com/questions/11669/mathematical-difference-between-white-and-black-notes-in-a-piano/11671#11671
http://www.quora.com/Why-are-there-12-notes-in-an-octave-and-why-do-we-ascribe-the-specific-frequencies-that-we-do-to-them
=end

=begin
We can prove this by looking at a piano keyboard. If we start on any key and call it
#1, and we ascend by pressing each black and white key in sequence until we arrive at
a key an octave above where we started, we'll be on #13 when we hit the octave. Ergo,
there are 12 semitones to an octave.

[pic] (show C -> C)
 _______________________________________
|  | | | |  |  | | | | | |  |  | | | |  |
|  | | | |  |  | | | | | |  |  | | | |  |
|  | | | |  |  | | | | | |  |  | | | |  |
|  |_| |_|  |  |_| |_| |_|  |  |_| |_|  |
|   |   |   |   |   |   |   |   |   |   |
| C |   |   |   |   |   |   | C |   |   |
|___|___|___|___|___|___|___|___|___|___|

    2   4       7   9  11
  1   3   5   6   8  10  12  13

Similarly on a guitar, if you play any open note, and ascend up that string playing the
note at each fret until you hit the octave, you'll arrive at the 12th fret, exactly
halfway along the string. You've halved the vibrating length of the string, and in doing
so doubled the fundamental frequency of the note being produced.

[detour] talk about overtones & harmonics?

[tip] Why did we count to 12 on the guitar to get to a new octave, but 13 on the piano?
On the guitar we started on the open fret (or fret #0), where on the piano we
started counting from #1. The distance between adjacent frets on a guitar and adjacent
keys on a piano is 1 semitone on both instruments.

=end


=begin
On the piano, the distance between any two consecutive notes is 1 semitone, or a half
tone. The distance between any two white notes skipping over a black note is 2
semitones, or a whole tone.
=end

    WHOLE_STEP = TONE     = T = 2
    HALF_STEP  = SEMITONE = S = 1

=begin
So why do we have black notes on a piano? [hard to move around, etc]
One reason is that this structure of black and white keys directly reflects the major
scale, which is the foundation, both directly and indirectly, of so much of our music.

If we start on middle C and play the white notes up to C1, that's the major scale in
the "key of C" - easy! This is true only for C - if we start on any other key and
play the white notes, we've actually played a mode of C (more later) - to play a
major scale in any other key, we need to use the black keys.

Armed with this knowledge about the key of C's special relationship to the major
scale, and our ability to count intervals in half and whole tones, we can
derive a recipe for building a major scale anywhere on the piano – and in fact,
on any instrument.

[pic]

That recipe can be expressed as [TONE, TONE, SEMITONE, TONE, TONE, TONE, SEMITONE ] ..

=end

=begin
This describes how we move between the notes of a major scale from the note
we start on: [2, 2, 1, 2, 2, 2, 1] - the final half-step landing us on an octave
above where we started.

It happens that when you do this on a piano keyboard starting on a C, each half
step is between adjacent white keys, and between each whole step is a black key.
=end

    # we don't need the last half-step to get back to the tonic; it's implied by the
    # 12 semitones and 7 natural notes - however it makes sense to write it the way
    # it is usually written, and more importantly this makes it easier to offset the
    # major scale formula to produce the minor scale formula
    MAJOR_SCALE_FORMULA = [T, T, S, T, T, T, S].freeze # => [2, 2, 1, 2, 2, 2, 1]

=begin
If we take the formula above and apply it starting from a C key on a piano, which we'll
call 1, this gives us the values [1, 3, 5, 6, 8, 10, 12] – which correspond on a piano to the white
(natural) notes, which are also all the notes in the C major scale (and its modes),
and it's relative minor, the A minor scale.

This also describes to us where the 'black' notes fall, which can be considered sharps
or flats, depending on the key.

The side effect of this is that C is the only major key signature without sharps or
flats.

semitone # starting from C
     natural notes
       piano "black keys" / incidentals
1  : C
2  :   (C#/Db)
3  : D
4  :   (D#/Eb)
5  : E
6  : F
7  :   (F#/Gb)
8  : G
9  :   (G#/Ab)
10 : A
11 :   (A#/Bb)
12 : B

major_scale_note_values = MAJOR_SCALE_FORMULA.inject([1]) do |array, interval|
  array << array.last + interval
end # => [1, 3, 5, 6, 8, 10, 12, 13]

=end

    MAJOR_SCALE_IN_SEMITONES =
      Util::build_numeric_scale_from_intervals MAJOR_SCALE_FORMULA # => [1, 3, 5, 6, 8, 10, 12, 13]

    ALPHABET = (:A..:G).to_a.freeze


=begin
the minor scale A is the same as the major scale C
so it provides a way to build the natural notes starting from the beginning of
the musical alphabet.
=end

    MINOR_SCALE_FORMULA = Util::minorify(MAJOR_SCALE_FORMULA) # => [2, 1, 2, 2, 1, 2, 2]

=begin
so going back to the idea of there being 12 semitones, we can now build a mapping of
the number of semitones starting from A

1  : A
2  :   (A#/Bb)
3  : B
4  : C
5  :   (C#/Db)
6  : D
7  :   (D#/Eb)
8  : E
9  : F
10 :   (F#/Gb)
11 : G
12 :   (G#/Ab)

=end

    MINOR_SCALE_IN_SEMITONES =
      Util::build_numeric_scale_from_intervals MINOR_SCALE_FORMULA
      # => [1, 3, 4, 6, 8, 9, 11, 13]

    NATURAL_NOTE_MAPPING = begin
      natural_notes = ALPHABET.map.with_index do |letter, index|
        value = MINOR_SCALE_IN_SEMITONES[index]
        [value, letter]
      end
      Hash[natural_notes]
    end

=begin
    begin
      minor_scale_semitones = MINOR_SCALE_IN_SEMITONES.dup.tap(&:pop)
    end
      Hash[
        MINOR_SCALE_IN_SEMITONES.map.with_index do |n, index|
          [n, ALPHABET[index]]
        end
      ] #.tap {|hash| delete(13) }.freeze
=end

=begin
The key of C is special in that it has no sharps or flats, and is usually
considered the "starting point" for the circle of fifths / fourths.

With this is mind, it'll make things easier for us much of the time if we think
about the musical alphabet as starting on C rather than A.

=end

    ALPHABET_FROM_C = Util::majorify(ALPHABET) # => [:C,:D,:E,:F,:G,:A,:B]

=begin
build a function to work out the accidentals in a key signature
look at C, D(##), E(####), F(b) ..
=end

=begin
NOW build the circle of fifths...
=end

    MAJOR      = :major
    MINOR      = :minor
    DOMINANT   = :dominant
    DIMINISHED = :diminished
    SUSPENDED  = :suspended

    # FIXME - can these be inferred / built from first principles?
    # MAJOR_SCALE_MODE_QUALITIES = [
    #   MAJOR,
    #   MINOR,
    #   MINOR,
    #   MAJOR,
    #   DOMINANT,
    #   MINOR,
    #   DIMINISHED,
    # ]

    MAJOR_SCALE_MODE_NAMES = [
      'Ionian'.freeze,
      'Dorian'.freeze,
      'Phrygian'.freeze,
      'Lydian'.freeze,
      'Mixolydian'.freeze,
      'Aeolian'.freeze,
      'Locrian'.freeze,
    ]

  end
end