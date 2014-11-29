(:CSE532 Project 3:)
(:File name: tss_query3.xquery:)
(:Author Kin Sum Liu (109247869):)
(:Brief description: Query for "pairs of contestants perform same piece with same max score at shows > 3 judges":)
(:I pledge my honor that all parts of this project were done by me alone and without collaboration with anybody else:)

xquery version "3.0";
declare default element namespace "http://localhost:8080/exist/apps/tss-collection";
let $tss := doc("/db/apps/tss-collection/tss.xml")/TSS

return
    <query3>
    {
        for $show1 in $tss/Show, $audition1 in $show1/Audition
        return
            for $show2 in $tss/Show, $audition2 in $show2/Audition
            where $audition1/Contestant < $audition2/Contestant and
                $audition1/Piece = $audition2/Piece and
                (:the show must have at least 3 judges:)
                count($audition1/Results/Result) > 2 and count($audition2/Results/Result) > 2 and
                (:the max score must be the same:)
                max($audition1/Results/Result/Score) = max($audition2/Results/Result/Score)
            return <result>{concat($audition1/Contestant, ' and ', $audition2/Contestant)}</result>
    }</query3>
