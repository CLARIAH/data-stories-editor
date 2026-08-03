import React from "react";
import {useState} from "react";

function CommentsElement({comments, userName}: {comments: object[], userName: string}) {
    const [editCommentMode, setEditCommentMode] = useState(false);
    const [refresh, setRefresh] = useState(false);
    const [newItem, setNewItem] = useState(true);
    const [comIndex, setComIndex] = useState(-1);
    let commText = "";
    let newDate = Date();

    function handleChange(e: React.FormEvent<HTMLTextAreaElement>): void {
        commText = e.currentTarget.value;
    }

    const saveComment = () => {
        if (newItem)
            comments.push({"comment": {"_text": commText}, "dct:author": userName, "dct:date": Date()});
        else {
            comments[comIndex]["comment"]["_text"] = commText;
            comments[comIndex]["comment"]["dct:author"] = userName;
        }
        setNewItem(true);
        setEditCommentMode(false);
    }

    const deleteComment = (commentIndex: number) => {
        if (window.confirm('Delete comment?')) {
            comments.splice(commentIndex, 1);
            setRefresh(!refresh);
        }

    }

    const editComment = (commentIndex: number) => {
        setEditCommentMode(true);
        setNewItem(false);
        setComIndex(commentIndex);
    }


    return (<div className="commentArea">
        {comments.map((item, index) => {
            return (
                <div key={index}>
                    {(!editCommentMode ) ?
                        (<>
                    <strong>{item["dct:author"]} - {item["dct:date"]}</strong>
                    <div className="multiLineText">{item["comment"]["_text"]}</div>
                    {item["dct:author"] === userName && <div className="sharedWithRow">
                        <div className="shareButton" onClick={() => editComment(index)}>edit</div>
                        <div className="shareButton" onClick={() => deleteComment(index)}>delete</div>
                    </div>}
                    <hr className="commentDivider"/>
                    </>) : (editCommentMode && !newItem && index === comIndex &&
                            <div>
                                <textarea onChange={handleChange}>{comments[comIndex]["comment"]["_text"]}</textarea>
                                <div className="commentSaveBtn">
                                    <button onClick={saveComment}>Save comment</button>
                                    <button onClick={() => setEditCommentMode(false)}>Discard</button>
                                </div>
                            </div>
                        )}
                </div>
            )
        })}
        {(editCommentMode && newItem) ?
            (<div>
                <textarea onChange={handleChange}></textarea>
                <div className="commentSaveBtn">
                <button onClick={saveComment}>Save comment</button>
                <button onClick={() => setEditCommentMode(false)}>Discard</button>
                </div>
            </div>) :
            (<>{newItem && <div  className="addCommentElement" onClick={() => setEditCommentMode(true)}>Add comment</div>}</>)}

    </div>)
}

export default CommentsElement;