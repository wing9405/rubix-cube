% [ [ r, r, r, r, r, r, r, r, r ], [ g, g, g, g, g, g, g, g, g ], [ b, b, b, b, b, b, b, b, b ], [ w, w, w, w, w, w, w, w, w ], [ y, y, y, y, y, y, y, y, y ], [ p, p, p, p, p, p, p, p, p ] ]

% list(Moves), solves(Moves, [ [y,o,r,r,r,g,r,r,r], [w,w,o,r,w,w,w,w,w], [r,y,y,y,y,y,y,y,y], [o,w,w,o,o,o,o,o,o], [g,g,g,g,g,r,g,g,g], [b,b,b,b,b,b,b,b,b] ]).

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

solves_i([ ], X, _, Trace) :- write('end: '), write(Trace), nl, cube_done(X).
solves_i([ H | T ], X, Visited, Trace) :-
    move(X, H, Y),
    not(memberchk(Y, Visited)),
    solves_i(T, Y, [Y | Visited], [H | Trace]).

solves(A, X) :- solves_i(A, X, [ X ], []).

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
    mF,
    [
        [F7,F4,F1,F8,F5,F2,F9,F6,F3],
        [U7,R2,R3,U8,R5,R6,U9,R8,R9],
        [B1,B2,B3,B4,B5,B6,B7,B8,B9],
        [L1,L2,D1,L4,L5,D2,L7,L8,D3],
        [U1,U2,U3,U4,U5,U6,L9,L6,L3],
        [R7,R4,R1,D4,D5,D6,D7,D8,D9]
    ]).

% Back b = rz.rz.f_.rz.rz
move(
    [
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [U1, U2, U3, U4, U5, U6, U7, U8, U9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    mB,
    [
        [F1,F2,F3,F4,F5,F6,F7,F8,F9],
        [R1,R2,U1,R4,R5,U2,R7,R8,U3],
        [B3,B6,B9,B2,B5,B8,B1,B4,B7],
        [D7,L2,L3,D8,L5,L6,D9,L8,L9],
        [L7,L4,L1,U4,U5,U6,U7,U8,U9],
        [D1,D2,D3,D4,D5,D6,R9,R6,R3]
    ]).

% Right r = rz.f_.rz_
move(
    [
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [U1, U2, U3, U4, U5, U6, U7, U8, U9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    mR,
    [
        [F1,F2,U3,F4,F5,U6,F7,F8,U9],
        [R3,R6,R9,R2,R5,R8,R1,R4,R7],
        [D9,B2,B3,D6,B5,B6,D3,B8,B9],
        [L1,L2,L3,L4,L5,L6,L7,L8,L9],
        [U1,U2,B7,U4,U5,B4,U7,U8,B1],
        [D1,D2,F3,D4,D5,F6,D7,D8,F9]
    ]).

% Left l = rz_.f.rz
move(
    [
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [U1, U2, U3, U4, U5, U6, U7, U8, U9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    mL,
    [
        [U1,F2,F3,U4,F5,F6,U7,F8,F9],
        [R1,R2,R3,R4,R5,R6,R7,R8,R9],
        [B1,B2,D7,B4,B5,D4,B7,B8,D1],
        [L7,L4,L1,L8,L5,L2,L9,L6,L3],
        [B9,U2,U3,B6,U5,U6,B3,U8,U9],
        [F1,D2,D3,F4,D5,D6,F7,D8,D9]
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
    mU,
    [
        [R1,R2,R3,F4,F5,F6,F7,F8,F9],
        [B1,B2,B3,R4,R5,R6,R7,R8,R9],
        [L1,L2,L3,B4,B5,B6,B7,B8,B9],
        [F1,F2,F3,L4,L5,L6,L7,L8,L9],
        [U7,U4,U1,U8,U5,U2,U9,U6,U3],
        [D1,D2,D3,D4,D5,D6,D7,D8,D9]
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
    mD,
    [
        [F1,F2,F3,F4,F5,F6,R7,R8,R9],
        [R1,R2,R3,R4,R5,R6,B7,B8,B9],
        [B1,B2,B3,B4,B5,B6,L7,L8,L9],
        [L1,L2,L3,L4,L5,L6,F7,F8,F9],
        [U1,U2,U3,U4,U5,U6,U7,U8,U9],
        [D3,D6,D9,D2,D5,D8,D1,D4,D7]
    ]).

% Revert actions
move(
    [
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [U1, U2, U3, U4, U5, U6, U7, U8, U9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    mf,
    [
        [F3,F6,F9,F2,F5,F8,F1,F4,F7],
        [D3,R2,R3,D2,R5,R6,D1,R8,R9],
        [B1,B2,B3,B4,B5,B6,B7,B8,B9],
        [L1,L2,U9,L4,L5,U8,L7,L8,U7],
        [U1,U2,U3,U4,U5,U6,R1,R4,R7],
        [L3,L6,L9,D4,D5,D6,D7,D8,D9]
    ]).
move(
    [
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [U1, U2, U3, U4, U5, U6, U7, U8, U9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    mb,
    [
        [F1,F2,F3,F4,F5,F6,F7,F8,F9],
        [R1,R2,D9,R4,R5,D8,R7,R8,D7],
        [B7,B4,B1,B8,B5,B2,B9,B6,B3],
        [U3,L2,L3,U2,L5,L6,U1,L8,L9],
        [R3,R6,R9,U4,U5,U6,U7,U8,U9],
        [D1,D2,D3,D4,D5,D6,L1,L4,L7]
    ]).
move(
    [
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [U1, U2, U3, U4, U5, U6, U7, U8, U9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    mr,
    [
        [F1,F2,D3,F4,F5,D6,F7,F8,D9],
        [R7,R4,R1,R8,R5,R2,R9,R6,R3],
        [U9,B2,B3,U6,B5,B6,U3,B8,B9],
        [L1,L2,L3,L4,L5,L6,L7,L8,L9],
        [U1,U2,F3,U4,U5,F6,U7,U8,F9],
        [D1,D2,B7,D4,D5,B4,D7,D8,B1]
    ]).
move(
    [
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [U1, U2, U3, U4, U5, U6, U7, U8, U9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    ml,
    [
        [D1,F2,F3,D4,F5,F6,D7,F8,F9],
        [R1,R2,R3,R4,R5,R6,R7,R8,R9],
        [B1,B2,U7,B4,B5,U4,B7,B8,U1],
        [L3,L6,L9,L2,L5,L8,L1,L4,L7],
        [F1,U2,U3,F4,U5,U6,F7,U8,U9],
        [B9,D2,D3,B6,D5,D6,B3,D8,D9]
    ]).
move(
    [
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [U1, U2, U3, U4, U5, U6, U7, U8, U9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    mu,
    [
        [L1,L2,L3,F4,F5,F6,F7,F8,F9],
        [F1,F2,F3,R4,R5,R6,R7,R8,R9],
        [R1,R2,R3,B4,B5,B6,B7,B8,B9],
        [B1,B2,B3,L4,L5,L6,L7,L8,L9],
        [U3,U6,U9,U2,U5,U8,U1,U4,U7],
        [D1,D2,D3,D4,D5,D6,D7,D8,D9]
    ]).
move(
    [
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [U1, U2, U3, U4, U5, U6, U7, U8, U9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    md,
    [
        [F1,F2,F3,F4,F5,F6,L7,L8,L9],
        [R1,R2,R3,R4,R5,R6,F7,F8,F9],
        [B1,B2,B3,B4,B5,B6,R7,R8,R9],
        [L1,L2,L3,L4,L5,L6,B7,B8,B9],
        [U1,U2,U3,U4,U5,U6,U7,U8,U9],
        [D7,D4,D1,D8,D5,D2,D9,D6,D3]
    ]).

% Rotate-Z
rotate(
    [
        F, R, B, L,
        [U1, U2, U3, U4, U5, U6, U7, U8, U9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    rz1,
    [
        R, B, L, F,
        [U7, U4, U1, U8, U5, U2, U9, U6, U3],
        [D3, D6, D9, D2, D5, D8, D1, D4, D7]
    ]).
rotate(
    [
        F, R, B, L,
        [U1, U2, U3, U4, U5, U6, U7, U8, U9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    rz2,
    [
        B,L,F,R,
        [U9,U8,U7,U6,U5,U4,U3,U2,U1],
        [D9,D8,D7,D6,D5,D4,D3,D2,D1]
    ]).
rotate(
    [
        F, R, B, L,
        [U1, U2, U3, U4, U5, U6, U7, U8, U9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    rz3,
    [
        L,F,R,B,
        [U3,U6,U9,U2,U5,U8,U1,U4,U7],
        [D7,D4,D1,D8,D5,D2,D9,D6,D3]
    ]).

% Rotate-X
rotate(
    [
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [U1, U2, U3, U4, U5, U6, U7, U8, U9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    rx1,
    [
        [F7,F4,F1,F8,F5,F2,F9,F6,F3],
        [U7,U4,U1,U8,U5,U2,U9,U6,U3],
        [B3,B6,B9,B2,B5,B8,B1,B4,B7],
        [D7,D4,D1,D8,D5,D2,D9,D6,D3],
        [L7,L4,L1,L8,L5,L2,L9,L6,L3],
        [R7,R4,R1,R8,R5,R2,R9,R6,R3]
    ]).
rotate(
    [
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [U1, U2, U3, U4, U5, U6, U7, U8, U9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    rx2,
    [
        [F9,F8,F7,F6,F5,F4,F3,F2,F1],
        [L9,L8,L7,L6,L5,L4,L3,L2,L1],
        [B9,B8,B7,B6,B5,B4,B3,B2,B1],
        [R9,R8,R7,R6,R5,R4,R3,R2,R1],
        [D9,D8,D7,D6,D5,D4,D3,D2,D1],
        [U9,U8,U7,U6,U5,U4,U3,U2,U1]
    ]).
rotate(
    [
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [U1, U2, U3, U4, U5, U6, U7, U8, U9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    rx3,
    [
        [F3,F6,F9,F2,F5,F8,F1,F4,F7],
        [D3,D6,D9,D2,D5,D8,D1,D4,D7],
        [B7,B4,B1,B8,B5,B2,B9,B6,B3],
        [U3,U6,U9,U2,U5,U8,U1,U4,U7],
        [R3,R6,R9,R2,R5,R8,R1,R4,R7],
        [L3,L6,L9,L2,L5,L8,L1,L4,L7]
    ]).

% Rotate-Y
rotate(
    [
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [U1, U2, U3, U4, U5, U6, U7, U8, U9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    ry1,
    [
        [D1,D2,D3,D4,D5,D6,D7,D8,D9],
        [R7,R4,R1,R8,R5,R2,R9,R6,R3],
        [U9,U8,U7,U6,U5,U4,U3,U2,U1],
        [L3,L6,L9,L2,L5,L8,L1,L4,L7],
        [F1,F2,F3,F4,F5,F6,F7,F8,F9],
        [B9,B8,B7,B6,B5,B4,B3,B2,B1]
    ]).
rotate(
    [
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [U1, U2, U3, U4, U5, U6, U7, U8, U9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    ry2,
    [
        [B9,B8,B7,B6,B5,B4,B3,B2,B1],
        [R9,R8,R7,R6,R5,R4,R3,R2,R1],
        [F9,F8,F7,F6,F5,F4,F3,F2,F1],
        [L9,L8,L7,L6,L5,L4,L3,L2,L1],
        [D1,D2,D3,D4,D5,D6,D7,D8,D9],
        [U1,U2,U3,U4,U5,U6,U7,U8,U9]
    ]).
rotate(
    [
        [F1, F2, F3, F4, F5, F6, F7, F8, F9],
        [R1, R2, R3, R4, R5, R6, R7, R8, R9],
        [B1, B2, B3, B4, B5, B6, B7, B8, B9],
        [L1, L2, L3, L4, L5, L6, L7, L8, L9],
        [U1, U2, U3, U4, U5, U6, U7, U8, U9],
        [D1, D2, D3, D4, D5, D6, D7, D8, D9]
    ],
    ry3,
    [
        [U1,U2,U3,U4,U5,U6,U7,U8,U9],
        [R3,R6,R9,R2,R5,R8,R1,R4,R7],
        [D9,D8,D7,D6,D5,D4,D3,D2,D1],
        [L7,L4,L1,L8,L5,L2,L9,L6,L3],
        [B9,B8,B7,B6,B5,B4,B3,B2,B1],
        [F1,F2,F3,F4,F5,F6,F7,F8,F9]
    ]).
