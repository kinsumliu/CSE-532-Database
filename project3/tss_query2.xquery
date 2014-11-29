(:CSE532 Project 3:)
(:File name: tss_query2.xquery:)
(:Author Kin Sum Liu (109247869):)
(:Brief description: Query for "pairs of contestants perform same piece with same average score":)
(:I pledge my honor that all parts of this project were done by me alone and without collaboration with anybody else:)

xquery version "3.0";
declare default element namespace "http://localhost:8080/exist/apps/tss-collection";
let $tss := doc("/db/apps/tss-collection/tss.xml")/TSS

return
    <query2>
    {
        for $show1 in $tss/Show, $audition1 in $show1/Audition
        return
            for $show2 in $tss/Show, $audition2 in $show2/Audition
            where $audition1/Contestant < $audition2/Contestant and
                $audition1/Piece = $audition2/Piece and
                (:compute average score for Result element:)
                avg($audition1/Results/Result/Score) = avg($audition2/Results/Result/Score)
            return <result>{concat($audition1/Contestant, ' and ', $audition2/Contestant)}</result>
    }</query2>
