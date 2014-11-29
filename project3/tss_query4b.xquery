(:CSE532 Project 3:)
(:File name: tss_query4b.xquery:)
(:Author Kin Sum Liu (109247869):)
(:Brief description: Query for "first contestant performed all the pieces of the second contestant with quantifiers":)

xquery version "3.0";
declare default element namespace "http://localhost:8080/exist/apps/tss-collection";

(:extract the contestants from the document:)
declare function local:extractContestants($audition as element()*) as element()* {
    for $contestant in $audition/Contestant
    return $contestant
};

let $tss := doc("/db/apps/tss-collection/tss.xml")/TSS
return
    <query4>
    {
        for $contestant1 in distinct-values(
             for $audition in $tss/Show/Audition
             return local:extractContestants($audition))
        return 
            for $contestant2 in distinct-values(
                for $audition in $tss/Show/Audition
                return local:extractContestants($audition))
            (:find all pieces that contestant plays:)
            let $contestant2Pieces :=
                for $audition2 in $tss/Show/Audition
                where $audition2/Contestant = $contestant2
                return $audition2/Piece
            (:for every piece that contestant2 plays, contestant1 must play it so "the result cannot be empty":)
            (:the quantifier "forall...implies" is used as every...satisfies:)
            where every $piece in $contestant2Pieces satisfies not(empty($tss/Show/Audition[Piece = $piece and Contestant = $contestant1])) and
                $contestant2 != $contestant1
            return <result>{concat($contestant1, ' dominates ', $contestant2)}</result>
    }</query4>