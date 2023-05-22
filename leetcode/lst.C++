// #include "stdafx.h"
#include <iostream>


struct ListNode {
    int val;
    ListNode *next;

    ListNode(int x) : val(x), next(nullptr) {}
};

using namespace std;

int main(){
    ListNode *head = new ListNode(1);
    head->next = new ListNode(2);
    head->next->next = new ListNode(3);

    for ( ListNode *ptr = head; 
    ListNode *i = ptr->next; ) {
        // Do something with ptr->val
        cout << ptr->val << endl;
    }
    return 0;
}
