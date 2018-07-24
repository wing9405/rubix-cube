% [ [ r, r, r, r, r, r, r, r, r ], [ g, g, g, g, g, g, g, g, g ], [ b, b, b, b, b, b, b, b, b ], [ w, w, w, w, w, w, w, w, w ], [ y, y, y, y, y, y, y, y, y ], [ p, p, p, p, p, p, p, p, p ] ]
% [ [ r, r, r, r, r, r, r, r, r ], [ y, g, g, y, g, g, y, g, g ], [ b, b, b, b, b, b, b, b, b ], [ w, w, p, w, w, p, w, w, p ], [ y, y, y, y, y, y, w, w, w ], [ g, g, g, p, p, p, p, p, p ] ]
% [ [y,o,r,r,r,g,r,r,r], [w,w,o,r,w,w,w,w,w], [r,y,y,y,y,y,y,y,y], [o,w,w,o,o,o,o,o,o], [g,g,g,g,g,r,g,g,g], [b,b,b,b,b,b,b,b,b] ]
% list(A), solves(A, [ [y,o,r,r,r,g,r,r,r], [w,w,o,r,w,w,w,w,w], [r,y,y,y,y,y,y,y,y], [o,w,w,o,o,o,o,o,o], [g,g,g,g,g,r,g,g,g], [b,b,b,b,b,b,b,b,b] ]).

list([]).
list([_ | T]) :- list(T).

facet_done([X, X, X, X, X, X, X, X, X]).

cube_done([F, R, B, L, U, D]) :-
    facet_done(F),
    facet_done(R),
    facet_done(B),
    facet_done(L),
    facet_done(U),
    facet_done(D).

solves_i([ ], X, _, N) :- write('end: '), write(N), nl, cube_done(X).
solves_i([ H | T ], X, Visited, N) :-
    move(X, H, Y),
    write(H), nl,
    not(memberchk(Y, Visited)),
    solves_i(T, Y, [Y | Visited], N+1).

solves(A, X) :- solves_i(A, X, [ X ], 0).


% Front
move(
    [
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [U1, U2, U3, U4, U5, U6, U7, U8, U9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    f,
    [
        [F7, F4, F1, F8, F5, F2, F9, F6, F3],
        [U7, R2, R3, U8, R5, R6, U9, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, D1, L4, L5, D2, L7, L8, D3],
        [U1, U2, U3, U4, U5, U6, L9, L6, L3],
        [R7, R4, R1, D4, D5, D6, D7, D8, D9]
    ]).

% Up
move(
    [
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [U1, U2, U3, U4, U5, U6, U7, U8, U9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    u,
    [
        [R1, R2, R3, F4, F5, F6, F7, F8, F9],
        [B1, B2, B3, R4, R5, R6, R7, R8, R9],
        [L1, L2, L3, B4, B5, B6, B7, B8, B9],
        [F1, F2, F3, L4, L5, L6, L7, L8, L9],
        [U7, U4, U1, U8, U5, U2, U9, U6, U3],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ]).

% Down
move(
    [
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [U1, U2, U3, U4, U5, U6, U7, U8, U9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    d,
    [
        [F1, F2, F3, F4, F5, F6, R7, R8, R9],
        [R1, R2, R3, R4, R5, R6, B7, B8, B9],
        [B1, B2, B3, B4, B5, B6, L7, L8, L9],
        [L1, L2, L3, L4, L5, L6, F7, F8, F9],
        [U1, U2, U3, U4, U5, U6, U7, U8, U9],
        [D3, D6, D9, D2, D5, D8, D1, D4, D7]
    ]).

% Middle
move(
    [
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [U1, U2, U3, U4, U5, U6, U7, U8, U9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    m,
    [
        [F1, U2, F3, F4, U5, F6, F7, U8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, D8, B3, B4, D5, B6, B7, D2, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [U1, B8, U3, U4, B5, U6, U7, B2, U9],
        [D1, F2, D3, D4, F5, D6, D7, F8, D9]
    ]).

% Equator
move(
    [
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [U1, U2, U3, U4, U5, U6, U7, U8, U9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    e,
    [
        [F1, F2, F3, R4, R5, R6, F7, F8, F9],
        [R1, R2, R3, B4, B5, B6, R7, R8, R9],
        [B1, B2, B3, L4, L5, L6, B7, B8, B9],
        [L1, L2, L3, F4, F5, F6, L7, L8, L9],
        [U1, U2, U3, U4, U5, U6, U7, U8, U9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ]).

% Rotate-Z
move(
    [
        F, R, B, L,
        [U1, U2, U3, U4, U5, U6, U7, U8, U9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    rz,
    [
        R, B, L, F,
        [U7, U4, U1, U8, U5, U2, U9, U6, U3],
        [D3, D6, D9, D2, D5, D8, D1, D4, D7]
    ]).

