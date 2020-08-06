# Bookshelf problem

You can check the challenge description [here](CHALLENGE_DESCRIPTION.md)

## Build

Install [stack](https://haskell-lang.org/get-started) and then:

```
stack build
```

## Usage

### Normal version:

This outputs the minimum number of shelves required:

```
stack run
```

#### Input example:

```
150 150 300 150 150
70 A Game of Thrones
76 A Clash of Kings
99 A Storm of Swords
75 A Feasts for Crows
105 A Dance With Dragons
```

#### Output example:

```
2
```

### With bonus:

This outputs the used shelves with the containing books (only the sizes)

```
stack run bonus
```

#### Input example:

```
150 150 300 150 150
70 A Game of Thrones
76 A Clash of Kings
99 A Storm of Swords
75 A Feasts for Crows
105 A Dance With Dragons
```

#### Output example:

```
76 | 99 | 105 | 20 empty
70 | 75 | 5 empty
```

## Test

```
stack test
```
