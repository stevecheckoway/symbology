log = [0]*256
alog = [0]*256

log[0] = -255
alog[0] = 1
for i in range(1,256):
    alog[i] = alog[i-1]*2
    if alog[i] >= 256:
        alog[i] = alog[i] ^ 301
    log[alog[i]] = i

print 'log:'
for i in range(0, 256):
    print i, log[i]
print 'alog:'
for i in range(0, 256):
    print i, alog[i]
