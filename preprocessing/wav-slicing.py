# 120 beats / minute -> 2 beats a second
# 8 beats a note
# 4 seconds every note

# 128 samples * 8 inst = 1024

from pydub import AudioSegment

newAudio = AudioSegment.from_wav("data_mono.wav")

for i in range(2048):
    t1 = i * 4000 # Works in milliseconds
    t2 = (i+1) * 4000

    newSlice= newAudio[t1:t2]
    newSlice.export(f'./slices/slice_{i}.wav', format="wav")
