in_thread do
  loop do
    sample :drum_bass_hard, amp: 2
    sleep 1
  end
end

in_thread do
  sleep 0.5
  loop do
    sample :drum_snare_hard, amp: 2
    sleep 1
  end
end

in_thread do
  sleep 2
  loop do
    sample :drum_cymbal_closed, amp: 3
    sleep 0.5
  end
end

in_thread do
  loop do
    sample :drum_cymbal_open, amp: 3
    sleep 4
  end
end

in_thread do
  with_fx :reverb do
    use_synth :pluck
    sleep 4
    loop do
      play chord( :Db4, :minor)
      sleep 1.75
      play chord( :Db4, :minor)
      sleep 0.5
      play chord( :Db4, :minor)
      sleep 1.75
      play chord( :B3, :major)
      sleep 1.75
      play chord( :b3, :major)
      sleep 0.5
      play chord( :B3, :minor)
      sleep 1.75
    end
  end
end

in_thread do
  use_synth :sound_in
  sleep 4
  loop do
    play :Db2
    sleep 1.75
    play :Db2
    sleep 0.5
    play :Db2
    sleep 1.75
    play :b1
    sleep 1.75
    play :b2, release: 0.2
    sleep 0.25
    play :b1, release: 0.2
    sleep 1.75
  end
end

in_thread do
  sleep 8
  with_fx :gverb do
    with_fx :wobble do
      use_synth :blade
      loop do
        play_pattern_timed chord( :Db, :minor), 0.25, apm: 0.001, release: 0.2
      end
    end
  end
end
