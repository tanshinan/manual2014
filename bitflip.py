#!/usr/bin/python

def main():
    flist=["manual2001.txt","manual30.txt","utnboken", "upphov","noupphov"]
    blist = {}
    fall = []
    print("songname|", end='')
    for f in flist:
        blist[f] = [l.strip() for l in open(f).readlines()]
        fall += blist[f]
        print(f,end='|')
    print()
    fall=list(set(fall))
    fall.sort()
    for song in fall:
        print(song, end='')
        for f in flist:
            if song in blist[f]:
                print('|x', end='')
            else:
                print('| ', end='')
        print()



if __name__ == "__main__":
    main()
