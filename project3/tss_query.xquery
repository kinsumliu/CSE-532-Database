xquery version "3.0";
declare default element namespace "http://localhost:8080/exist/apps/tss-collection";

declare function local:extractContestants($audition as element()*) as element()* {
    for $contestant in $audition/Contestant
    return $contestant
};


 
let $tss := doc("/db/apps/tss-collection/tss.xml")/TSS
return
    <testquery>
    {
         for $contestant1 in distinct-values(
             for $audition in $tss/Show/Audition
             return local:extractContestants($audition)),
            $contestant2 in distinct-values(
             for $audition in $tss/Show/Audition
             return local:extractContestants($audition))
        let $contestant2Pieces :=
            for $audition2 in $tss/Show/Audition
            where $audition2/Contestant = $contestant2
            return $audition2/Piece
        return 
            for $audition1 in $tss/Show/Audition
            where every $piece in $contestant2Pieces satisfies $audition1/Piece = $piece
                and $audition1/Contestant = $contestant1
            return <result>{concat($contestant1, ' dominates ', $contestant2)}</result>
    }</testquery>