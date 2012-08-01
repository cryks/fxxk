;; coding: utf-8

(add-load-path "." :relative)
(use fxxk)
(use gauche.test)

(test-start "f**k")
(test-module 'fxxk)

(test-section "f**k")

;; Sample code from Wikipedia

(let1 bf (make-f**k)
  (test* "BrainF*ck"
    "Hello, world!"
    (with-string-io ""
      (cut bf "+++++++++[>++++++++>+++++++++++>+++++<<<-]>.>++.+++++++..+++.>-.------------.<++++++++.--------.+++.------.--------.>+.")))
  (test* "BrainF*ck (echo)"
    "Hello, world!"
    (with-string-io "Hello, world!"
      (cut bf "+[>,.<]"))))

(let1 ook (make-f**k '((nxt . "Ook. Ook?")
                       (prv . "Ook? Ook.")
                       (inc . "Ook. Ook.")
                       (dec . "Ook! Ook!")
                       (get . "Ook. Ook!")
                       (put . "Ook! Ook.")
                       (opn . "Ook! Ook?")
                       (cls . "Ook? Ook!")))
  (test* "Ook!"
    "Hello World!\n"
    (with-string-io ""
      (cut ook
        "Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook.
        Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook! Ook? Ook. Ook?
        Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook.
        Ook. Ook. Ook. Ook? Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook.
        Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook.
        Ook. Ook? Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook? Ook. Ook.
        Ook? Ook. Ook? Ook. Ook? Ook. Ook? Ook. Ook! Ook! Ook? Ook!
        Ook. Ook? Ook. Ook. Ook. Ook. Ook! Ook. Ook. Ook? Ook. Ook.
        Ook! Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook.
        Ook. Ook. Ook. Ook. Ook! Ook. Ook! Ook. Ook. Ook. Ook. Ook.
        Ook. Ook. Ook! Ook. Ook. Ook? Ook. Ook. Ook. Ook. Ook! Ook.
        Ook? Ook. Ook? Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook.
        Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook.
        Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook! Ook.
        Ook. Ook? Ook! Ook. Ook. Ook. Ook. Ook. Ook. Ook. Ook! Ook.
        Ook! Ook! Ook! Ook! Ook! Ook! Ook! Ook! Ook! Ook! Ook! Ook!
        Ook! Ook. Ook! Ook! Ook! Ook! Ook! Ook! Ook! Ook! Ook! Ook!
        Ook! Ook! Ook! Ook! Ook! Ook! Ook! Ook. Ook. Ook? Ook. Ook.
        Ook! Ook. Ook. Ook? Ook! Ook."))))

;; http://homepage2.nifty.com/kujira_niku/okayu/misa.html

(let1 misakura (make-f**k '((nxt . ">") (nxt . "→") (nxt . "～") (nxt . "ー")
                            (prv . "<") (prv . "←") (prv . "★") (prv . "☆")
                            (inc . "+") (inc . "あ") (inc . "ぁ") (inc . "お") (inc . "ぉ")
                            (dec . "-") (dec . "っ") (dec . "ッ")
                            (put . ".") (put . "！")
                            (get . ",") (get . "？")
                            (opn . "[") (opn . "「") (opn . "『")
                            (cls . "]") (cls . "」") (cls . "』")))
  (test* "misakura"
    "Hello World!\n"
    (with-string-io ""
      (cut misakura
        "ごっ、ごぉおっ、ご～きげんよおぉおおぉおほっ。ほおぉおぉおっ。

        「ごきげん☆みゃぁああ”あ”ぁ”ぁああ～っ」

        さわやかな朝の☆ご挨拶！　お挨拶がっ。
        澄みきった青空にこだましちゃうぉ～ああぉおおおぉん。

        「は、はひっ、はろおぉっ☆わぁるどおおぉっぉ～っ」

        こ、この文章は☆おサンプル！　おおぉおぉおおサンプルプログラム！！
        どんなおプログラム言語でも基本のご挨拶させていただくのぉぉおッ！

        「ぽうっ」

        長々と書くのがこ、ここでの～、ここでのぉおおぉおぉぉおたしなみぃぃいぃ。

        「長いぃ。長すぎましゅう。ご挨拶にこんなプログラム長すぎまひゅぅうぅ☆
        　んおおぉぉ、ばかになる、おばかになっちゃいましゅ～ッ」

        長いのがあぁあぁあああぁっ、バッファあぁああああぁぁぁの奥まあぁぁで入ってきましゅたああぁぁああぁああぁああぁあぁあっ！
        --------------------------------
        ばっふぁ☆溢れちゃいまひゅぅ～。あみゃぁあ”あ”ぁ”ぁああ”あ”ぁぁ。

        「で、出ます☆　んおおぉぉおおっ、エラー出ちゃいまひゅっ」

        ほひぃ☆！　え、えらーっ、んお”お”ぉお”お”ぉおぉおおぉっっ。

        「出た☆　出た出た出た出たぁぁあっ　えらあぴゅるーっって出たあぁっ」

        はしたない☆！　ぉおおぉはしたないっ！　おはしたない言語ですっっっっっっっ！
        おほっほおぉっっっほおぉっっっっっっっっっ！

        「えらあらいしゅきぃぃぃいぃっっ」

        止まらない　すごい　エラーみるく
        こってりしたのがいっぱい出てるよぉぉぉおおぉぉおおぉぉおっっ。

        「んほぉっ☆ っおぉぉぉおお国が分からなくなっちゃいまひゅう～っ」

        ま、まだ出るぅ☆　出てるのおぉっ☆　エラーまだまだ出ましゅぅぅ！
        ばんじゃ～ぁぁあい、ばんじゃいぃぃ、ばんにゃんじゃぁんじゃあぁぁああぁい！"))))


(test-end)
