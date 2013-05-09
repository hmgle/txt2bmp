# txt2bmp

*txt2bmp* - convert text to bitmap file.

## Building txt2bmp

    make

To install:

    make install

## Usage:

Displays help:

    ./txt2bmp -h


> Usage: ./txt2bmp [Options] [inputfile]    
> 
> Options:    
>         -l val        set left margin    
>         -r val        set right margin    
>         -u val        set top margin    
>         -d val        set bottom margin    
>         -i val        set line spacing    
>         -c val        set character spacing    
>         -m val        set max line length    
>         -b val        set bits_per_pix    
>         -g val        set background color    
>         -f val        set foreground color   

## Example

	echo "hello, world" | ./txt2bmp > hello.bmp

	./txt2bmp -l 32 -r 32 -u 48 -d 32 -i 4 -m 38 \
		-g 0xa85f README.md > README.bmp


## License

See [LICENSE.md](LICENSE.md).



