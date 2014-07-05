
Quill Frontend - Design
=======================


Published View
--------------

In this view the content of the document is the primary focus. The full text of 
the document is visible (with scroll).  Feedback on a section of the document is 
identified by a small icon in the left or right margin. Icon should contain some 
data (like the number or activity level of the feedback), and possibly a score 
summarizing the overall position of the feedback.


Feedback View
-------------

In this view most of the document is hidden, only the active section is visible. 
Feedback about this section (and the feedback hierarchy descending from it) are 
the primary focus of this view.

See `<mockups/feedback-view-1.html>`_


Thread View
-----------

In this view most of document is hidden, only the active section is visible. A 
single thread of feedback and responses to feedback are visible, back to the
original section of the document. The thread is the path through the tree from
a leaf to the root in the document.
