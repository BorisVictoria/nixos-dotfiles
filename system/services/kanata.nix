{ ... }: {
  services.kanata = {
    enable = true;
    keyboards.main = {
      port = 6666;
      config = ''
        (defsrc
        )

        (deflayermap (comet)
          ;; Comet by StronglyTyped
          q b
          w l
          e c
          r w
          t k
          y j
          u y
          i o
          o u
          p '

          a n
          s r
          d s
          f t
          g m
          h d
          j h
          k e
          l i
          ; a
          ' ,

          z x
          x z
          c v
          v g
          b q
          n p
          m f
          , /
          . .
          / ;

          ;; Layers
          enter (multi f24 (tap-hold-press 200 200 enter (layer-while-held symbols)))
          caps (multi f24 (tap-hold-press 200 200 f24 (layer-while-held symbols)))

          spc (multi f24 (tap-hold-press 200 200 spc (layer-while-held numbers)))

        )

        (deflayermap (symbols)
          q '
          w S-,
          e S-.
          r S-'
          t .
          y S-7
          u `
          i [
          o ]
          p RS-5

          a RS-1
          s -
          d S-=
          f =
          g RS-3
          h S-\
          j S-;
          k S-9
          l S-0
          ; S-/

          z S-6
          x /
          c S-8
          v \
          b S--
          n RS-`
          m RS-4
          , S-[
          . S-]
          / RS-2
        )

        (deflayermap (numbers)
          u 7
          i 8
          o 9
          j 4
          k 5
          l 6
          m 1
          , 2
          . 3
          h .
          n 0
        )
      '';
    };
  };
}
