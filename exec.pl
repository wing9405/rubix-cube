#!/usr/bin/env swipl

:- initialization(main, main).

main(_) :-
    [rubix_iterative_deepening],
    write('Input a rubix-cube configuration:'), nl,
    read(Conf),
    write('Your input: '), write(Conf), nl,
    write('Continue? (y/n) '),
    (
        read(y), !, list(Moves), solves(Moves, Conf)
        ;
        write('Bye~'), nl
    ).

