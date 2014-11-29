(:CSE532 Project 3:)
(:File name: tss_query1.xquery:)
(:Author Kin Sum Liu (109247869):)
(:Brief description: Query for "pairs of contestants perform same piece in same show with same score from at least one judge":)

xquery version "3.0";
declare default element namespace "http://localhost:8080/exist/apps/tss-collection";
let $tss := doc("/db/apps/tss-collection/tss.xml")/TSS

return
    <query1>
    {
        for $show1 in $tss/Show, 
            $audition1 in $show1/Audition, 
            $result1 in $audition1/Results/Result
        return 
            (:join auditions based on piece, show and score:)
            for $show2 in $tss/Show, 
                $audition2 in $show2/Audition, 
                $result2 in $audition2/Results/Result
            where $show1/ShowDate = $show2/ShowDate and
                (:same judge:)
                $result1/Judge = $result2/Judge and
                $result1/Score = $result2/Score and
                $audition1/Piece = $audition2/Piece and
                $audition1/Contestant < $audition2/Contestant 
            return <result>{concat($audition1/Contestant, ' and ', $audition2/Contestant)}</result>
    }</query1>