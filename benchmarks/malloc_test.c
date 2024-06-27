#ifdef HEADER_MALLOC
#include "malloc-header.h"
#endif
#ifdef INLINE_MALLOC
#include "malloc-inline.h"
#endif
#ifdef LINKED_MALLOC
#include "malloc-linked.h"
#endif

#define LL_SIZE 65536

typedef struct linked_list_s{
    int value;
    struct linked_list_s* next;
} linked_list_s;

/* Creates a linked list where the value is the position of the link */
linked_list_s *create_initial_list(){
    linked_list_s *output = malloc(sizeof(linked_list_s));
    linked_list_s *tmp = output;
    for(size_t i = 0; i < LL_SIZE; i++){
        tmp->value = i;
        tmp->next = malloc(sizeof(linked_list_s));
        tmp = tmp->next;
    }
    tmp->value = LL_SIZE;
    tmp->next = NULL;
    return output;
}

/* Frees linked list */
void free_linked_list(linked_list_s *list){
    linked_list_s *tmp = list;
    while(tmp != NULL){
        linked_list_s *next = tmp->next;
        free(tmp);
        tmp = next;
    }
}

int main(){
    linked_list_s *list = create_initial_list();
    free_linked_list(list);
}