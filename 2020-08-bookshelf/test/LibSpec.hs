module LibSpec (spec) where

import Test.Hspec
import Lib

spec :: Spec
spec = do
  describe "minBookshelves" $ do
    it "should calculate the minimum number of shelves require to fit the given books" $ do
      let shelves = createShelf <$> [150, 150, 300, 150, 150]
          books = [ Book 70 "A Game of Thrones"
                  , Book 76 "A Clash of Kings"
                  , Book 99 "A Storm of Swords"
                  , Book 75 "A Feasts for Crows"
                  , Book 105 "A Dance With Dragons"
                  ]
      minBookshelvesCount books shelves `shouldBe` Just 2

    it "should work with long lists" $ do
      let shelves = createShelf <$> [270, 142, 501, 865, 384, 957, 947, 603, 987
                                    , 428, 907, 10, 691, 707, 397, 917, 492, 750
                                    , 935, 672, 935, 712, 234, 683, 702, 508, 822
                                    , 379, 36, 59, 382, 280, 867, 155, 829, 756
                                    , 360, 995, 526, 52, 559, 250, 450, 843, 523
                                    , 446, 972, 555, 55, 985, 81, 831, 43, 802
                                    , 473, 379, 461, 639, 910, 529, 128, 878, 914
                                    , 426, 569, 59, 139, 913, 69, 649, 501, 889
                                    , 470, 112, 92, 6, 80, 571, 220, 22, 676, 91
                                    , 889, 799, 115, 194, 555, 477, 277, 718, 378
                                    , 838, 822, 358, 178, 562, 674]
          books = [ Book 96 "b400786"
                  , Book 69 "b390773"
                  , Book 174 "b410413"
                  , Book 189 "b337528"
                  , Book 80 "b308576"
                  , Book 194 "b151872"
                  , Book 190 "b174310"
                  , Book 157 "b272731"
                  , Book 45 "b326576"
                  , Book 112 "b379689"
                  , Book 177 "b18459"
                  , Book 122 "b915759"
                  , Book 138 "b967342"
                  , Book 96 "b786519"
                  , Book 184 "b718074"
                  , Book 75 "b696975"
                  , Book 192 "b46366"
                  , Book 168 "b533904"
                  , Book 45 "b885475"
                  , Book 186 "b872991"
                  , Book 63 "b231207"
                  , Book 162 "b912709"
                  , Book 123 "b786720"
                  , Book 7 "b743805"
                  , Book 120 "b862301"
                  , Book 54 "b929784"
                  , Book 89 "b61876"
                  , Book 168 "b775890"
                  , Book 87 "b850242"
                  , Book 60 "b695331"
                  , Book 0 "b56157"
                  , Book 139 "b875241"
                  , Book 78 "b281324"
                  , Book 122 "b236962"
                  , Book 1 "b79403"
                  , Book 68 "b213353"
                  , Book 103 "b650997"
                  , Book 97 "b955752"
                  , Book 177 "b815100"
                  , Book 139 "b958679"
                  , Book 43 "b829736"
                  , Book 163 "b445471"
                  , Book 94 "b472821"
                  , Book 167 "b5429"
                  , Book 57 "b946679"
                  , Book 13 "b748794"
                  , Book 146 "b920913"
                  , Book 17 "b547056"
                  , Book 33 "b437091"
                  , Book 12 "b247401"
                  , Book 120 "b228908"
                  , Book 178 "b509018"
                  , Book 98 "b482352"
                  , Book 152 "b915322"
                  , Book 14 "b874214"
                  , Book 71 "b164605"
                  , Book 11 "b457140"
                  , Book 35 "b502201"
                  , Book 5 "b15232"
                  , Book 49 "b641136"
                  , Book 166 "b385360"
                  , Book 183 "b78285"
                  , Book 199 "b274935"
                  , Book 195 "b424221"
                  , Book 79 "b422570"
                  , Book 150 "b502699"
                  , Book 41 "b662132"
                  , Book 63 "b430898"
                  , Book 111 "b813368"
                  , Book 100 "b700970"
                  , Book 157 "b803925"
                  , Book 140 "b611243"
                  , Book 25 "b877197"
                  , Book 136 "b577201"
                  , Book 94 "b50211"
                  , Book 56 "b762270"
                  , Book 120 "b578094"
                  , Book 21 "b672002"
                  , Book 9 "b107630"
                  , Book 156 "b547721"
                  , Book 186 "b911854"
                  , Book 71 "b594375"
                  , Book 32 "b330202"
                  , Book 3 "b464002"
                  , Book 36 "b718293"
                  , Book 44 "b282975"
                  , Book 130 "b826246"
                  , Book 77 "b529800"
                  , Book 117 "b66381"
                  , Book 89 "b949447"
                  , Book 133 "b348326"
                  , Book 178 "b517646"
                  , Book 184 "b809038"
                  , Book 105 "b70260"
                  , Book 182 "b894577"
                  , Book 123 "b203409"
                  , Book 79 "b174217"
                  , Book 159 "b552286"
                  , Book 40 "b854638"
                  , Book 78 "b159990"
                  , Book 139 "b743008"
                  , Book 1 "b714402"
                  , Book 153 "b923819"
                  , Book 107 "b201001"
                  , Book 48 "b567066"
                  , Book 138 "b570537"
                  , Book 100 "b64396"
                  , Book 139 "b412215"
                  , Book 132 "b805036"
                  , Book 121 "b772401"
                  , Book 120 "b370907"
                  , Book 51 "b388905"
                  , Book 77 "b442295"
                  , Book 152 "b195720"
                  , Book 46 "b453542"
                  ]
      minBookshelvesCount books shelves `shouldBe` Just 13

    it "should return Nothing if fitting the books is impossible" $ do
      let shelves = createShelf <$> [500, 500, 500]
          books = [ Book 1309 "Artamene"
                  , Book 303 "A la recherche du temps perdu"
                  , Book 399 "Mission Earth"
                  ]
      minBookshelvesCount books shelves `shouldBe` Nothing
