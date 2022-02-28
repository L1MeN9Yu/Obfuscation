//
// Created by Mengyu Li on 2022/2/28.
//

@testable import Obfuscation
import XCTest

final class StringObfuscateTests: XCTestCase {
    func testStrings() {
        XCTAssertEqual("".a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p.q.r.s.t.u.v.w.x.y.z, "abcdefghijklmnopqrstuvwxyz")
        XCTAssertEqual("".A.B.C.D.E.F.G.H.I.J.K.L.M.N.O.P.Q.R.S.T.U.V.W.X.Y.Z, "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        XCTAssertEqual(""._1._2._3._4._5._6._7._8._9._0, "1234567890")
        XCTAssertEqual(
            ""
                .space
                .point
                .dash
                .comma
                .semicolon
                .colon
                .apostrophe
                .quotation
                .plus
                .equals
                .paren_left
                .paren_right
                .asterisk
                .ampersand
                .caret
                .percent
                .dollar
                .pound
                .at
                .exclamation
                .question_mark
                .back_slash
                .forward_slash
                .curly_left
                .curly_right
                .bracket_left
                .bracket_right
                .bar
                .less_than
                .greater_than
                .underscore,
            " "
                + "."
                + "-"
                + ","
                + ";"
                + ":"
                + "'"
                + "\""
                + "+"
                + "="
                + "("
                + ")"
                + "*"
                + "&"
                + "^"
                + "%"
                + "$"
                + "#"
                + "@"
                + "!"
                + "?"
                + "\\"
                + "/"
                + "{"
                + "}"
                + "["
                + "]"
                + "|"
                + "<"
                + ">"
                + "_"
        )
    }
}
